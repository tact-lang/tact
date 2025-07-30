struct Ints {
    a:Int; b:Int; c:Int; d:Int; e:Int; f:Int; g:Int; h:Int; i:Int; j:Int;
}

struct Strings {
    a:String; b:String; c:String; d:String; e:String; f:String; g:String; h:String; i:String; j:String;
}

struct Combine {
    ints: Ints;
    strs: Strings;
}

contract LargeNested {
    val: Combine;
    init() {
        self.val = Combine{
            ints: Ints{a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10},
            strs: Strings{a:"a",b:"b",c:"c",d:"d",e:"e",f:"f",g:"g",h:"h",i:"i",j:"j"}
        };
    }
}