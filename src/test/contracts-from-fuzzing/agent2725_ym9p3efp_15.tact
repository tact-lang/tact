struct ManyStrings {
    a:String; b:String; c:String; d:String; e:String; f:String; g:String; h:String; i:String; j:String;
}

contract BigStrings {
    data: ManyStrings;

    init() {
        self.data = ManyStrings{
            a:"a",b:"b",c:"c",d:"d",e:"e",f:"f",g:"g",h:"h",i:"i",j:"j"
        };
    }
}