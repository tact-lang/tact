struct InnerMapStruct {
    mapInner: map<Int, Int>;
}

contract MapStateTest {
    data: map<Address, InnerMapStruct>;

    init() {
        self.data = emptyMap();
    }
}