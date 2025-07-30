struct Small {
    x:Int;
}

struct Mid {
    a:Small; b:Small; c:Small; d:Small; e:Small;
}

struct Large {
    f:Mid; g:Mid; h:Mid; i:Mid; j:Mid;
}

contract Test {
    val: Large;
    init() {
        self.val = Large{
            f: Mid{
                a:Small{x:1}, b:Small{x:2}, c:Small{x:3}, d:Small{x:4}, e:Small{x:5} },
            g: Mid{
                a:Small{x:6}, b:Small{x:7}, c:Small{x:8}, d:Small{x:9}, e:Small{x:10} },
            h: Mid{
                a:Small{x:11}, b:Small{x:12}, c:Small{x:13}, d:Small{x:14}, e:Small{x:15} },
            i: Mid{
                a:Small{x:16}, b:Small{x:17}, c:Small{x:18}, d:Small{x:19}, e:Small{x:20} },
            j: Mid{
                a:Small{x:21}, b:Small{x:22}, c:Small{x:23}, d:Small{x:24}, e:Small{x:25} }
        };
    }
}