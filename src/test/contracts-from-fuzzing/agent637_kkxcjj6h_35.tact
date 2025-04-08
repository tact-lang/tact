struct SOpt {
    a: Int?;
}

fun make(): SOpt {
    return SOpt{};
}

contract Test {
    get fun getter(): SOpt {
        return make();
    }
}