struct BoolDefaultOpt {
    a: Bool = true;
    b: Bool?;
}

contract BoolTest {
    val: BoolDefaultOpt;
    
    init() {
        self.val = BoolDefaultOpt{
            b: null
        };
    }
}