struct NestedDefaultsMix {
    intVal: Int=42;
    optStr: String?=null;
    boolVal: Bool=true;
}

contract NestedDefaultsMixTest {
    val: NestedDefaultsMix;
    init(){
        self.val = NestedDefaultsMix{};
    }
}