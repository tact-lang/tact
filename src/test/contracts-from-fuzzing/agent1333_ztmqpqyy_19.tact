struct S4 { val: Int; }
struct S3 { next: S4?; }
struct S2 { next: S3?; }
struct S1 { next: S2?; }

contract TestContract {
    deep: S1? = null;

    init() {}

    receive() {
        if (self.deep != null) {
            let l2 = self.deep!!.next;
            if (l2 != null) {
                let l3 = l2!!.next;
                if (l3 != null) {
                    let l4 = l3!!.next;
                    if (l4 != null) {
                        dump(l4!!.val);
                    }
                }
            }
        }
    }
}