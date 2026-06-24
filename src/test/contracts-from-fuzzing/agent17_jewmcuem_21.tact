message Alpha { data: Int }
message Beta { alpha: Alpha }

contract Test {
    receive(msg: Beta) {}
    receive(msg: Alpha) {}
}