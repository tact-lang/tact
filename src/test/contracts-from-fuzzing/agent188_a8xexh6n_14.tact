struct X { v: Int }
struct Y { v: X }
struct Z { v: Y }

contract MultiLevelStruct {
    myz: Z;

    init() {
        self.myz = Z { v: Y { v: X { v: 7 } } };
    }
}
