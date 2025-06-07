struct SA { x: Int; y: Int }
contract WideStructContract {
    s1: SA;
    s2: SA;
    s3: SA;
    init() {
       self.s1 = SA{ x:1,y:2 };
       self.s2 = SA{ x:3,y:4 };
       self.s3 = SA{ x:5,y:6 };
    }
}
