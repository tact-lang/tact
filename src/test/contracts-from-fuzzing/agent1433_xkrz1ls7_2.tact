struct Deep {
    x: Int;
    y: Bool;
}

struct Outer {
    first: Deep;
    second: Deep;
    third: Deep;
}

contract TestContract {
    info: Outer;
    init() {
        self.info = Outer{
            first: Deep{ x:1, y:true },
            second: Deep{ x:2, y:false },
            third: Deep{ x:3, y:true },
        };
    }
}