//
//  ViewController.m
//  LessonThree
//
//  Created by Admin on 04.04.15.
//  Copyright (c) 2015 Mariya Beketova. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray * mArray; //объявление глобальных объектов (проперти - это свойства объекта, которые живут на протяжении всего класса)
@property (nonatomic, strong) NSArray * arrayPrices;
@property (nonatomic, strong) NSArray * arrayVolues;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //вывести на экран строку Test string, начиная с 4(3) символа:
    NSString * string = @"Test string";
    NSString * string1 = [string substringFromIndex:3];
    NSLog(@"%@ %@", string, string1);
    
    //конвертируем число типа дабл в строку и обрезаем лишние нули:
    double d = 24.5;
    NSLog(@"d %f", d);
    
    NSRange range = NSMakeRange(0, 4); //метод, который обрезает строку (0 - с какого символа, 4 - сколько символов оставить)
    NSString * doubleString = [NSString stringWithFormat:@"%f", d]; //Преобразовываем число d в строку
    NSString * string2 = [doubleString substringWithRange:range]; //обрезаем строку по методу "range"
    NSLog(@"doubleString %@, string2 %@ ", doubleString, string2);
    
    //сравнение символов в строке: isEqualToString:
    if (![string isEqualToString:string]) {
        NSLog(@"YES");
    }
    else if ([string isEqualToString:@"Notest"]) {
        NSLog(@"YES");
    }
    else {
        NSLog(@"NO");
    }
    
    //использование конца длины строки:
    NSInteger intI = [string length]; //метод (length)считает кол-во символов в строке
    NSLog(@"intI %li", (long)intI);
    
    //переформатировать значение обратно в перменную (рассмотрим на примере BOOL)
    double dub = 1;
    NSString * doubleString2 = [NSString stringWithFormat:@"%f", dub];
    BOOL dub2 = [doubleString2 boolValue];
    NSLog(@"%d", dub2);
    
    //убрать лишние символы в тексте:
    NSString * string3 = @"Test, lessson, three"; //необходимо убрать лишние запятые в этой строке
    NSString * string4 = [string3 stringByReplacingOccurrencesOfString:@", " withString:@"-"]; //заменили запятую на тире
    NSLog(@"%@ -> %@", string3, string4);
    
    //убрать в тексте все символы послле определенного (например, после пробела):
    NSString * string5 = [[string componentsSeparatedByString:@" "]firstObject];
    NSLog(@"%@", string5);
    
    //массивы:
    NSArray * array = [[NSArray alloc] initWithObjects:string1, @"Test", string2, string3, string4, nil];
    NSLog(@"array: %@", array);
    
    //дынный метод разбивает массив на строки, когда встречает символ: "-":
    NSArray * arrayFromString = [string4 componentsSeparatedByString:@"-"];
    NSLog(@"arrayFromString: %@", arrayFromString);
    
    //вот так можно вывести кол-во элементов в массиве:
    NSLog(@"arrayFromString: %lu", (unsigned long)arrayFromString.count);
    
    //так же можно создавать условия с помощью массивов, пример:
    for (int i = 0; i < 3; i++) { //здесь вместо цифры 3 можно использовать обозначение конца массива: arrayFromString.count
        NSLog(@"[arrayFromString objectAtIndex:i] %@", [arrayFromString objectAtIndex:i]);
        if ([[arrayFromString objectAtIndex:i] isEqualToString:@"lessson"]) {
            
            NSLog(@"[arrayFromString objectAtIndex:i] %@", [arrayFromString objectAtIndex:i+1]);
        }
    }
    NSLog(@"array %i", arrayFromString.count);
    
    //массив NSArray - нельзя изменять! для этого лучше воспользоваться массивом: NSMutableArray
    
    //пример ниже добавляет в массив mArray каждый элемент из массива arrayFromString
    NSMutableArray * mArray = [[NSMutableArray alloc]init];
    for (NSString * string in arrayFromString) {
        [mArray addObject:string];
    }
    NSLog(@"%@", mArray);
    
    //добавление в массив при условии, что в массиве нет объекта: lessson
    for (NSString * string in arrayFromString) {
        if (![string isEqualToString:@"lessson"]) {
            [mArray addObject:string]; //если в условии убрать ! и вместо addObject написать: removeObject, то у нас уберется объект (lesson) из массива
        }
    }
    NSLog(@"%@", mArray);
    
    
     //NSDictionary - Коллекция и ключи (массив из значений и ключей), в коллекцию нельзя помещать примитивные переменные, их необходимо оборачивать в NSNamber
    NSDictionary * dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                           @"string1", @"str1",
                           @"string2", @"str2",
                           @"string3", @"str3",
                           arrayFromString, @"array", nil];
    NSLog(@"%@", dict);
    
    //можно ту же задачу написать немного упрощеннее:
    NSDictionary * dict4 = @{@"string1":@"str1", @"string2":@"str2", @"string3":@"str3",arrayFromString:@"array"};
    NSLog(@"%@", dict4);
    
    
    //пример оборачивания примитивной переменной двумя способами:
    NSInteger j = 17;
    NSInteger k = 18;
    //1 способ:
    NSDictionary * dict2 = [[NSDictionary alloc] initWithObjectsAndKeys:
                            [NSNumber numberWithInt:j], @"int j", nil];
    NSLog(@"%@", dict2);
    
    //2 способ:
    NSDictionary * dict3 = [[NSDictionary alloc] initWithObjectsAndKeys:
                            @(k), @"int k", nil];
    NSLog(@"%@", dict3);
    
    
    //практическое применение коллекций:
    
    NSString * stringPrices = @"123,1020,500";
    NSString * stringVolues = @"Тетрадь,Телевизор,Утюг";
    
    self.arrayPrices = [stringPrices componentsSeparatedByString:@","];
    self.arrayVolues = [stringVolues componentsSeparatedByString:@","];
    
    
    
    
    
    //NSSortDescriptor - данный метод сортирует по разным принципам (см. фреймворк)
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
