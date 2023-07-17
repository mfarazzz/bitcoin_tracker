
class Currencies {
  Time? time;
  String? disclaimer;
  String? chartName;
  Bpi? bpi;

  Currencies({this.time, this.disclaimer, this.chartName, this.bpi});

  Currencies.fromJson(Map<String, dynamic> json) {
    if(json["time"] is Map) {
      time = json["time"] == null ? null : Time.fromJson(json["time"]);
    }
    if(json["disclaimer"] is String) {
      disclaimer = json["disclaimer"];
    }
    if(json["chartName"] is String) {
      chartName = json["chartName"];
    }
    if(json["bpi"] is Map) {
      bpi = json["bpi"] == null ? null : Bpi.fromJson(json["bpi"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(time != null) {
      _data["time"] = time?.toJson();
    }
    _data["disclaimer"] = disclaimer;
    _data["chartName"] = chartName;
    if(bpi != null) {
      _data["bpi"] = bpi?.toJson();
    }
    return _data;
  }
}

class Bpi {
  Usd? usd;
  Gbp? gbp;
  Eur? eur;

  Bpi({this.usd, this.gbp, this.eur});

  Bpi.fromJson(Map<String, dynamic> json) {
    if(json["USD"] is Map) {
      usd = json["USD"] == null ? null : Usd.fromJson(json["USD"]);
    }
    if(json["GBP"] is Map) {
      gbp = json["GBP"] == null ? null : Gbp.fromJson(json["GBP"]);
    }
    if(json["EUR"] is Map) {
      eur = json["EUR"] == null ? null : Eur.fromJson(json["EUR"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(usd != null) {
      _data["USD"] = usd?.toJson();
    }
    if(gbp != null) {
      _data["GBP"] = gbp?.toJson();
    }
    if(eur != null) {
      _data["EUR"] = eur?.toJson();
    }
    return _data;
  }
}

class Eur {
  String? code;
  String? symbol;
  String? rate;
  String? description;
  double? rateFloat;

  Eur({this.code, this.symbol, this.rate, this.description, this.rateFloat});

  Eur.fromJson(Map<String, dynamic> json) {
    if(json["code"] is String) {
      code = json["code"];
    }
    if(json["symbol"] is String) {
      symbol = json["symbol"];
    }
    if(json["rate"] is String) {
      rate = json["rate"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["rate_float"] is double) {
      rateFloat = json["rate_float"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["symbol"] = symbol;
    _data["rate"] = rate;
    _data["description"] = description;
    _data["rate_float"] = rateFloat;
    return _data;
  }
}

class Gbp {
  String? code;
  String? symbol;
  String? rate;
  String? description;
  double? rateFloat;

  Gbp({this.code, this.symbol, this.rate, this.description, this.rateFloat});

  Gbp.fromJson(Map<String, dynamic> json) {
    if(json["code"] is String) {
      code = json["code"];
    }
    if(json["symbol"] is String) {
      symbol = json["symbol"];
    }
    if(json["rate"] is String) {
      rate = json["rate"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["rate_float"] is double) {
      rateFloat = json["rate_float"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["symbol"] = symbol;
    _data["rate"] = rate;
    _data["description"] = description;
    _data["rate_float"] = rateFloat;
    return _data;
  }
}

class Usd {
  String? code;
  String? symbol;
  String? rate;
  String? description;
  double? rateFloat;

  Usd({this.code, this.symbol, this.rate, this.description, this.rateFloat});

  Usd.fromJson(Map<String, dynamic> json) {
    if(json["code"] is String) {
      code = json["code"];
    }
    if(json["symbol"] is String) {
      symbol = json["symbol"];
    }
    if(json["rate"] is String) {
      rate = json["rate"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["rate_float"] is double) {
      rateFloat = json["rate_float"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["symbol"] = symbol;
    _data["rate"] = rate;
    _data["description"] = description;
    _data["rate_float"] = rateFloat;
    return _data;
  }
}

class Time {
  String? updated;
  String? updatedIso;
  String? updateduk;

  Time({this.updated, this.updatedIso, this.updateduk});

  Time.fromJson(Map<String, dynamic> json) {
    if(json["updated"] is String) {
      updated = json["updated"];
    }
    if(json["updatedISO"] is String) {
      updatedIso = json["updatedISO"];
    }
    if(json["updateduk"] is String) {
      updateduk = json["updateduk"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["updated"] = updated;
    _data["updatedISO"] = updatedIso;
    _data["updateduk"] = updateduk;
    return _data;
  }
}