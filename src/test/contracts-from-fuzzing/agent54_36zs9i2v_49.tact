struct MultipleOptionals {
    a:Int?;
    b:Int?;
    c:Int?;
}

contract InitSomeNull {
    s: MultipleOptionals;

    init() {
        self.s = MultipleOptionals{a:1,b:null,c:null};
    }
}