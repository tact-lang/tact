struct Alpha {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
}

struct Beta {
    x: Alpha;
    y: Int?;
    z: String;
}

struct Gamma {
    one: Beta;
    two: Beta;
    three: Beta;
}

contract BigNested {
    biggie: Gamma;

    init() {
        self.biggie = Gamma{
            one: Beta{
                x: Alpha{a:1,b:true,c:"A",d:null},
                y: null,
                z: "one",
            },
            two: Beta{
                x: Alpha{a:2,b:false,c:"B",d:5},
                y: 7,
                z: "two",
            },
            three: Beta{
                x: Alpha{a:3,b:true,c:"C",d:null},
                y: null,
                z: "three",
            },
        };
    }
}