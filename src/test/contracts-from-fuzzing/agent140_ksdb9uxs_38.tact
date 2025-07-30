struct AStruct { a: Int }
struct BStruct { b: Int }

struct OuterS {
    as_: AStruct;
    bs: BStruct;
}

contract MultipleStructs {
    o: OuterS;

    init() {
        self.o = OuterS{
            as_: AStruct{ a: 1 },
            bs: BStruct{ b: 2 },
        };
    }
}