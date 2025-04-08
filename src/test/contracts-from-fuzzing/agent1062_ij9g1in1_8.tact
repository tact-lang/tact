struct Mid {
    a: Int;
    b: Bool;
    c: String;
}

struct Outer {
    m1: Mid;
    m2: Mid;
    m3: Mid;
}

contract MultipleStructs {
    payload: Outer;

    init() {
        self.payload = Outer{
            m1: Mid{a:1,b:true,c:"x"},
            m2: Mid{a:2,b:false,c:"y"},
            m3: Mid{a:3,b:true,c:"z"}
        };
    }
}