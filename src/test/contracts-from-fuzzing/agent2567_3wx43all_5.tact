struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct SWithNestedStructOptional {
    n: NestedOptionals?;
}

contract NestedOptStructInStorage {
    s: SWithNestedStructOptional;
    
    init() {
        self.s = SWithNestedStructOptional{
            n: NestedOptionals{a:1,b:true,c:"str"}
        };
    }
}