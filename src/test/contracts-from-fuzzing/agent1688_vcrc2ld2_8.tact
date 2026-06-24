struct OneOptional {
    flag: Bool?;
}

contract TestContract {
    status: OneOptional;
    
    init() {
        self.status = OneOptional{
            flag: null
        };
    }
}