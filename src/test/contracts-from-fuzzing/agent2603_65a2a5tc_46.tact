struct AAA { a:Int }
struct BBB { b:Int }
struct CCC { c:Int }

contract MultiSeparate {
    x: AAA;
    y: BBB;
    z: CCC;
    init() {
        self.x=AAA{a:1};
        self.y=BBB{b:2};
        self.z=CCC{c:3};
    }
}
