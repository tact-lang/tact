struct Alpha {
 val: Int;
}

struct Beta {
 val: Alpha;
}

contract MultiNestedDefault {
 data: Beta = Beta{ val: Alpha{ val:123 } };
}