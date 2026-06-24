struct Deep1 { v1: Int }
struct Deep2 { v2: Deep1 }
struct Deep3 { v3: Deep2 }
struct Deep4 { v4: Deep3 }
struct Deep5 { v5: Deep4 }

contract DeepStorage {
    data: Deep5;

    init() {
        self.data = Deep5{
            v5: Deep4{
                v4: Deep3{
                    v3: Deep2{
                        v2: Deep1{
                            v1: 77
                        }
                    }
                }
            }
        };
    }
}