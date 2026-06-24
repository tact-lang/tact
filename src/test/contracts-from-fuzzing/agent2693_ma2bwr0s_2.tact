contract ManyOptionalFields {
    optional1: Int?;
    optional2: Bool?;
    optional3: Address?;
    optional4: Cell?;
    optional5: Slice?;
    optional6: String?;
    optional7: DeepNestedLevel4?;
    optional8: DeepNestedLevel3?;
    optional9: DeepNestedLevel2?;

    init() {
        self.optional1 = null;
        self.optional2 = null;
        self.optional3 = null;
        self.optional4 = null;
        self.optional5 = null;
        self.optional6 = null;
        self.optional7 = null;
        self.optional8 = null;
        self.optional9 = null;
    }
}

struct DeepNestedLevel4 {
    finalField: Int;
}

struct DeepNestedLevel3 {
    nested4: DeepNestedLevel4;
    optional4: DeepNestedLevel4?;
}

struct DeepNestedLevel2 {
    nested3: DeepNestedLevel3;
    optional3: DeepNestedLevel3?;
}
