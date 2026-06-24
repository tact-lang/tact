struct A {
    x: Int;
    y: Int;
}

contract Test {
    one: A;
    two: A;
    three: A;
    four: A;
    five: A;
    six: A;
    seven: A;
    eight: A;
    nine: A;
    ten: A;

    init() {
        self.one = A{x:1,y:2};
        self.two = A{x:3,y:4};
        self.three = A{x:5,y:6};
        self.four = A{x:7,y:8};
        self.five = A{x:9,y:10};
        self.six = A{x:11,y:12};
        self.seven = A{x:13,y:14};
        self.eight = A{x:15,y:16};
        self.nine = A{x:17,y:18};
        self.ten = A{x:19,y:20};
    }
}
