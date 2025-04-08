struct WidePersistent {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: String?;
    f6: Bool?;
}

struct DeepPersistent {
    nested: WidePersistent;
    nested2: WidePersistent;
}

contract WideDeepPersistentContract {
    data: DeepPersistent;

    init() {
        self.data = DeepPersistent{
            nested: WidePersistent{
                f1:1, f2:true, f3:"A", f4:null, f5:null, f6: false
            },
            nested2: WidePersistent{
                f1:2, f2:false, f3:"B", f4:3, f5:"hi", f6: null
            }
        };
    }
}