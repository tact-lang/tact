struct HasStrings {
    str1:String;
    str2:String;
}

struct NestedStrs {
    inner:HasStrings;
}

contract NestedStrings {
    val:NestedStrs;
    init(){
        self.val = NestedStrs{
            inner: HasStrings{
                str1:"foo",
                str2:"bar"
            }
        };
    }
}