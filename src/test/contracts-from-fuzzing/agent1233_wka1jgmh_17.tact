// Contract with many string and slice fields
contract ManyStringsSlices {
    str1: String = "a";
    str2: String = "b";
    str3: String = "c";
    slice1: Slice;
    slice2: Slice;
    slice3: Slice;

    init() {
        self.slice1 = emptyCell().asSlice();
        self.slice2 = emptyCell().asSlice();
        self.slice3 = emptyCell().asSlice();
    }
}