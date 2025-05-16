struct PA { x: Int; y: Int }
struct SA { a: PA; b: PA; c: PA }
struct SB { a: PA; b: PA; c: PA }

contract MultiGroup {
    one: SA;
    two: SB;

    init() {
        self.one = SA{ a:PA{x:1,y:1}, b:PA{x:2,y:2}, c:PA{x:3,y:3} };
        self.two = SB{ a:PA{x:4,y:4}, b:PA{x:5,y:5}, c:PA{x:6,y:6} };
    }
}