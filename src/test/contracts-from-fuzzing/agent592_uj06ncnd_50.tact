struct HasStrBool {
 s: String;
 b: Bool;
}

contract NestedBoolStr {
 field: HasStrBool;
 init(){self.field=HasStrBool{s:"abc",b:true};}
}