struct InnerS { x: Int }

struct OuterS { first: InnerS; second: InnerS }

contract StructDefaults {
    a: Int = 42;
    rec: OuterS = OuterS{ first: InnerS{ x:1 }, second: InnerS{ x:2 } };
}