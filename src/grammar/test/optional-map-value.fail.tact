contract TestContract {
    m: map<Int, Int?>; // Int? is invalid for values

    receive () {}
}
