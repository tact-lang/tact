struct Mini { x:Int }
struct Mid { a:Mini; b:Int }
struct Max { c:Mid; d:Int }

contract InlineDeepNest {
    state: Max;

    init() {
        self.state = Max{
            c:Mid{ a:Mini{x:1}, b:2 },
            d:3
        };
    }
}