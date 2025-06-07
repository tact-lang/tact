struct ContainStringOptional {
    s: String?;
}

contract StringOptionTest {
    inside: ContainStringOptional;
    
    init() {
        self.inside = ContainStringOptional{ s: null };
    }
}