struct NestedLevel3 { val: Int }
struct NestedLevel2 { s3: NestedLevel3 }
struct NestedLevel1 { s2: NestedLevel2 }

contract TestContract {
    nested: NestedLevel1;

    init() {
        self.nested = NestedLevel1{
            s2: NestedLevel2{
                s3: NestedLevel3{ val: 42 }
            }
        };
    }
}