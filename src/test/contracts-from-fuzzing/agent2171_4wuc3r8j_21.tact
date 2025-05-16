struct HasBool {
    f: Bool;
}

contract InitializedBool {
    data: HasBool;
    
    init() {
        self.data = HasBool{ f: false };
    }
}