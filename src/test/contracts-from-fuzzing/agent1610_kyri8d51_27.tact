struct NestedOptStrings {
    sa: String?;
    sb: String?;
    sc: String?;
}

contract NestedOptStringsTest {
    strs: NestedOptStrings;
    init() {
        self.strs = NestedOptStrings{
            sa:null, sb:null, sc:null
        };
    }
}