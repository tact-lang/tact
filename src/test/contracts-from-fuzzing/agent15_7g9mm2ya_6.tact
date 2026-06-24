contract H {
    init() {}
    get fun getId(): Int {
       return 1;
    }
}

contract G {
    get fun getHData(): Cell {
      return initOf H().data;
    }
}

contract F {
    get fun getGData(): Cell {
      return initOf G().data;
    }
}

contract E {
    get fun getFData(): Cell {
      return initOf F().data;
    }
}

contract D {
    get fun getEData(): Cell {
      return initOf E().data;
    }
}
