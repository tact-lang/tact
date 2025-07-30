struct DeepMany {
    one: Int; two: Int; three: Int; four: Int; five: Int;
    six: Int; seven: Int; eight: Int; nine: Int; ten: Int;
}

struct Container {
    d1: DeepMany;
    d2: DeepMany;
    d3: DeepMany;
}

contract Test {
    val: Container;
    init() {
     self.val = Container{
            d1: DeepMany{ one:1, two:2, three:3, four:4, five:5, six:6, seven:7, eight:8, nine:9, ten:10 },
            d2: DeepMany{ one:11, two:12, three:13, four:14, five:15, six:16, seven:17, eight:18, nine:19, ten:20 },
            d3: DeepMany{ one:21, two:22, three:23, four:24, five:25, six:26, seven:27, eight:28, nine:29, ten:30 }
        };
    }
}