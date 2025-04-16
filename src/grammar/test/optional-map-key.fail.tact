contract TestContract {
    m: map<Int?, Int>; // Int? is invalid for keys

    receive () {}
}
