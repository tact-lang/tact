contract Self {
    get fun selfInit(): Cell {
        return initOf Self().data;
    }
}
