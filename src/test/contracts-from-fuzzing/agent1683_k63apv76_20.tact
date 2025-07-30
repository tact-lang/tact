struct MultiLevel1 { val: Int; }
struct MultiLevel2 { a: MultiLevel1; }
struct MultiLevel3 { b: MultiLevel2; }
struct MultiLevel4 { c: MultiLevel3; }
struct MultiLevel5 { d: MultiLevel4; }

contract TestContract {
    top: MultiLevel5 = MultiLevel5{
        d: MultiLevel4{
            c: MultiLevel3{
                b: MultiLevel2{
                    a: MultiLevel1{ val: 555 }
                }
            }
        }
    };
}