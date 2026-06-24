struct AllOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract ManyNulls {
    vals: AllOptionals;

    init() {
        self.vals = AllOptionals{
            a:null,b:null,c:null,d:null,e:null
        };
    }
}