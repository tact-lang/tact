contract SingleLargeIntField {
    huge_number: Int as int257;
    
    init() {
        self.huge_number = 123456789012345678901234567890;
    }
}