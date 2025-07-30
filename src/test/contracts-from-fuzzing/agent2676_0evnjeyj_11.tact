struct Meta {
    code: Cell?; 
    owner: Address?;
    valid: Bool = false;
}

contract OptNestedStruct {
    meta: Meta? = null;

    init() {
        self.meta = Meta{
            code: null,
            owner: null,
            valid: true
        };
    }
}