//
//  Stopwatch.swift
//  stopwatch
//
//  Created by Swapnil Kumbhar on 2022-05-13.
//

import Foundation

class Stopwatch: ObservableObject  {
    @Published var time = "0:0";
    var seconds = 0.0;
    var minutes = 0;
    var timer = Timer();
    var is_started = false;
    
    func start() {
        if (!is_started) {
            is_started = true;
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                self.seconds += 0.1;
                if (Int(self.seconds) == 6) {
                    self.seconds = 0.0;
                    self.minutes += 1;
                }
                self.time = self.getTime();
                }
            }
        }
        
    func stop() {
        is_started = false;
        self.timer.invalidate();
        seconds = 0.0;
    }
    
    func lap() -> String {
        if (is_started)
        {
            return time;
        }
        else
        {
            return "0";
        }
    }
    
    func getTime() -> String {
        return "\(self.minutes):\(String(format: "%.2f", self.seconds))"
    }
}
