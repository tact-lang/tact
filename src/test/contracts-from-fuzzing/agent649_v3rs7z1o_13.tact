struct Small {
    i: Int;
}

struct BigNested1 { a: Small; b: Small; c: Small; d: Small; }
struct BigNested2 { a: BigNested1; b: BigNested1; }
struct BigNested3 { a: BigNested2; b: BigNested2; }

contract BulkNested {
    payload: BigNested3;

    init() {
        self.payload = BigNested3{
            a: BigNested2{
                a: BigNested1{ a:Small{i:1}, b:Small{i:2}, c:Small{i:3}, d:Small{i:4} },
                b: BigNested1{ a:Small{i:5}, b:Small{i:6}, c:Small{i:7}, d:Small{i:8} }
            },
            b: BigNested2{
                a: BigNested1{ a:Small{i:9}, b:Small{i:10}, c:Small{i:11}, d:Small{i:12} },
                b: BigNested1{ a:Small{i:13}, b:Small{i:14}, c:Small{i:15}, d:Small{i:16} }
            }
        };
    }
}