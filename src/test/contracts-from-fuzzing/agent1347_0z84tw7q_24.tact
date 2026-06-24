struct WeirdSigned {
    s1: Int as int3;
    s2: Int as int9;
    s3: Int as int15;
    s4: Int as int33;
    s5: Int as int66;
}

contract TestContract {
    data: WeirdSigned;

    init() {
        self.data = WeirdSigned{
            s1: -3,
            s2: 200,
            s3: -12000,
            s4: 123456789,
            s5: -987654321
        };
    }
}