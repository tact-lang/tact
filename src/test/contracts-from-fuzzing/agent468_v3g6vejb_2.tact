struct OptionalNest { innerOpt: Int?; }

contract TestContract {
    optionalNested: OptionalNest;
    
    init() {
        self.optionalNested = OptionalNest{ innerOpt: null };
    }
}