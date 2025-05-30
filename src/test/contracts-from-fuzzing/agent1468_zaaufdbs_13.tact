struct Inner1 {
    a: Int;
    b: String;
}

struct Inner2 {
    x: Bool;
    y: Int?;
}

struct Massive {
    f1: Inner1;
    f2: Inner2;
    f3: Int;
    f4: Int?;
    f5: String;
    f6: Bool;
    f7: String?;
    f8: Inner1;
    f9: Inner2;
}

contract TestMassive {
    data: Massive;

    init() {
        self.data = Massive{
            f1: Inner1{a:1,b:"x"},
            f2: Inner2{x:true,y:null},
            f3: 5,
            f4: null,
            f5: "hi",
            f6: false,
            f7: null,
            f8: Inner1{a:2,b:"y"},
            f9: Inner2{x:false,y:null},
        };
    }
}