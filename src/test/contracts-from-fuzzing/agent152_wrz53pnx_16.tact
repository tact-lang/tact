struct Inner1 { f: Int }
struct Inner2 { f: Bool }
struct Inner3 { f: String }
struct Inner4 { f: Address? }
struct Inner5 { f: Slice }

struct NestLevels {
    i1: Inner1;
    i2: Inner2;
    i3: Inner3;
    i4: Inner4;
    i5: Inner5;
}

contract MultiTypedNestedOpt {
    data: NestLevels;

    init() {
        self.data = NestLevels{
            i1:Inner1{f:1}, i2:Inner2{f:true}, i3:Inner3{f:"a"}, i4:Inner4{f:null}, i5:Inner5{f:emptyCell().asSlice()}
        };
    }
}