struct Metric {
    label: String;
    value: Int?;
}

struct Dashboard {
    m1: Metric;
    m2: Metric;
    m3: Metric;
    m4: Metric;
}

contract ManySimilarStructs {
    dash: Dashboard;

    init() {
        self.dash = Dashboard{
            m1: Metric{label:"", value:null},
            m2: Metric{label:"", value:null},
            m3: Metric{label:"", value:null},
            m4: Metric{label:"", value:null},
        };
    }
}