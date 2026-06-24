struct InnerOptionals {
    flag: Bool?;
    count: Int?;
}

contract TestContract {
    comp: InnerOptionals;
    
    init() {
        self.comp = InnerOptionals{ flag: null, count: null };
    }
}