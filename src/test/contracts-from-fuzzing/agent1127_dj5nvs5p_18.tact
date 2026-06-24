struct Inner {
    z: Int;
}

struct Outer {
    x: Int;
    y: Bool;
    inn: Inner;
}

contract MultipleAssign {
    data: Outer;

    init() {
        self.data = Outer{ x:1, y:true, inn:Inner{z:3} };
        self.data.x = 10;
        self.data.inn.z = 30;
    }
}
