struct A {
    x: Int;
    y: Bool;
}

contract InitDirectAssign {
    point: A;
    
    init() {
        let tmp = A{ x: 2, y: true };
        self.point = tmp;
    }
}