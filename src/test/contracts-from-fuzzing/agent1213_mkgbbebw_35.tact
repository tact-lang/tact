struct MixedSet {
    val1: Int?;
    val2: Bool;
    val3: String?;
    val4: Slice;
}

contract MixedSetTest {
    m: MixedSet;

    init() {
        self.m = MixedSet{ val1:null, val2:true, val3:null, val4:emptyCell().asSlice() };
    }
}