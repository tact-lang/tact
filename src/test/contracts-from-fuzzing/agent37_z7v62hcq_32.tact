struct TreeLvl3 { val: Int }
struct TreeLvl2 { left: TreeLvl3?; right: TreeLvl3?; }
struct TreeLvl1 { left: TreeLvl2?; right: TreeLvl2?; }

contract Test {
    tree: TreeLvl1;
    init() {
        self.tree = TreeLvl1{
            left: TreeLvl2{
                left: TreeLvl3{val: 1},
                right: null
            },
            right: null
        };
    }
}