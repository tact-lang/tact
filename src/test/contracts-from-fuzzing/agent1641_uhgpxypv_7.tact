struct Mid {
    a: Int;
    b: Bool;
    c: String;
}

struct Top {
    x: Mid;
    y: Mid;
    z: Mid;
    flag: Bool;
}

contract TestContract {
    val: Top;

    init() {
        self.val = Top{
            x: Mid{a:1,b:true,c:"x"},
            y: Mid{a:2,b:false,c:"y"},
            z: Mid{a:3,b:true,c:"z"},
            flag: false
        };
    }
}