struct X { a: Int; b: Int; c: Int; d: Int; e: Int; }
struct Y { x: X; f: Int; g: Int; }
contract MixedDepth {
    state: Y = Y{ x: X{a:1,b:2,c:3,d:4,e:5}, f:6, g:7 };
    init() {
        self.state = Y{ x: X{a:11,b:12,c:13,d:14,e:15}, f:16,g:17 };
    }
}