
#This file paths should be changed based on their location in your local machine
chuk1 = "/Volumes/NO NAME/samples/chuck riff 1.aiff"
chuk2 = "/Volumes/NO NAME/samples/chuck riff 2.aiff"
brk = "/Volumes/NO NAME/samples/BrianAuger-ThoughtsFromAfar.aiff"
arp = "/Volumes/NO NAME/samples/chuck arp 1.aiff"
twang = "/Volumes/NO NAME/samples/chuck twang on 3.aiff"
hat = "/Volumes/NO NAME/samples/aug hats.aiff"
robust = "/Volumes/NO NAME/samples/chuck robust twang.aiff"
drone = "/Volumes/NO NAME/samples/chuck drone.aiff"
thin2 = "/Volumes/NO NAME/samples/chuk thin 2.aiff"
thin1 = "/Volumes/NO NAME/samples/chuk thin 1.aiff"


use_bpm 70

live_loop :vengence do
  sample arp, beat_stretch: 4, amp: 2
  sleep 4
end

n = 3
live_loop :twg, sync: :vengence do
  if n == 2
    sample robust, beat_stretch: 4, amp: 2
    sleep 4
    2.times do
      sample twang, beat_stretch: 4, num_slices: 2, slice: (ring, 1, 0).tick, amp: 4
      sleep 2
    end
  else
    sleep 8
  end
end

live_loop :drown, sync: :vengence do
  sleep 4
  sample drone, beat_stretch: 4
  sleep 4
end

a = 3
with_fx :reverb, room: 0.8 do
  live_loop :chuck, sync: :vengence do
    if n == 0
      sample thin1, beat_stretch: 4, amp: a
      sleep 8
      sample thin2, beat_stretch: 4, amp: a + 1
      sleep 8
    else if n == 1
      sample chuk1, beat_stretch: 4, amp: a
      sleep 8
      sample chuk2, beat_stretch: 4, amp: a
      sleep 8
    else
      sleep 16
    end
  end
end
end

live_loop :cord, sync: :vengence do
  use_synth :rodeo
  sleep 4
  play chord(:b3 - 0.23, :minor, invert: (ring, 2, 1).tick), attack: 1, release: 0.8, amp: 0.5
  sleep 4
end


live_loop :biz, sync: :vengence do
  with_fx :lpf, cutoff: 60 do
    use_synth :chipbass
    play :b1 - 0.23, release: 6, amp: 1.6
    sleep 8
  end
end

live_loop :break, sync: :vengence do
  sample brk, beat_stretch: 4, amp: 3.5, pan: -0.4
  sample brk, beat_stretch: 4, amp: 3.5, pan: 0.4
  sleep 4
end

live_loop :hats, sync: :vengence do
  sample hat, beat_stretch: 0.25, amp: 2
  sleep 0.5
end

live_loop :bcut, sync: :vengence do
  sleep 4
  sleep 0.25
  sample brk, onset: 0, amp: 3
  sleep 2.25
  sample brk, onset: 0, amp: 3
  sleep 1.5
end
