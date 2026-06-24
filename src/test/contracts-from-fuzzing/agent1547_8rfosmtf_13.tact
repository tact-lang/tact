struct SA {
    x: Int;
    y: Int;
}

struct SB {
    sa: SA;
    val: Int;
}

struct SC {
    sb1: SB;
    sb2: SB;
    extra: Int;
}

contract ManyNestedStructs {
    data: SC;

    init() {
        self.data = SC{
            sb1: SB{sa: SA{x:1,y:2}, val:3},
            sb2: SB{sa: SA{x:4,y:5}, val:6},
            extra: 10
        };
    }
}